interface Env {
	DB: D1Database; // Define the DB binding
}

async function getAllMovies(db: D1Database, categoryParam: string | null, searchParam: string | null, sortParam: string | null) {
	let query = `SELECT * FROM Movies WHERE 1=1`; // Start with a base query that is always true

	// Filter by category if provided
	if (categoryParam) {
		query += ` AND categories LIKE '%"${categoryParam}"%'`;
	}

	// Apply search filter if provided
	if (searchParam) {
		query += ` AND title LIKE '%${searchParam}%'`;
	}

	// Apply sorting if provided
	if (sortParam === 'Alphabetically') {
		query += ` ORDER BY title`;
	} else if (sortParam === 'MetaScoreAsc') {
		query += ` ORDER BY meta_score`; // Default sorting by title if no sortParam is provided
	} else if (sortParam === 'MetaScoreDesc') {
		query += ` ORDER BY meta_score DESC`; // Default sorting by title if no sortParam is provided
	} else if (sortParam === 'YearAsc') {
		query += ` ORDER BY production_year`; // Default sorting by title if no sortParam is provided
	} else if (sortParam === 'YearDesc') {
		query += ` ORDER BY production_year DESC`; // Default sorting by title if no sortParam is provided
	} else {
		query += ` ORDER BY id`;
	}

	// Prepare and execute the query
	const statement = db.prepare(query);

	// Bind search parameters if searchParam exists
	if (searchParam) {
		statement.bind(searchParam, searchParam);
	}

	const { results } = await statement.all();
	return results;
}

async function getAllSavedMovies(db: D1Database) {
	const query = `SELECT * FROM SavedMovies`;
	const { results } = await db.prepare(query).all();
	return results;
}

async function getAllCategories(db: D1Database) {
	const query = 'SELECT * From Categories';
	const { results } = await db.prepare(query).all();
	return results;
}
async function getMovieById(db: D1Database, movieId: number) {
	try {
		console.log(`Fetching movie with ID: ${movieId}`); // Add this line
		const query = `SELECT * FROM Movies WHERE id = ?`;
		const { results } = await db.prepare(query).bind(movieId).all();
		if (results.length === 0) {
			return null; // No results found
		}
		return results[0]; // Return the first result
	} catch (error) {
		console.error('Error fetching movie:', error);
		throw error; // Propagate the error
	}
}

async function toggleSaveStatus(db: D1Database, movieId: number) {
	// Toggle the save status of the movie
	const currentStatusQuery = `SELECT is_saved FROM Movies WHERE id = ?`;
	const { results: currentResults } = await db.prepare(currentStatusQuery).bind(movieId).all();

	if (currentResults.length === 0) {
		throw new Error('Movie not found');
	}

	const currentStatus = currentResults[0].is_saved;
	const newStatus = !currentStatus;

	// Update the movie's save status
	const updateQuery = `UPDATE Movies SET is_saved = ? WHERE id = ?`;
	await db.prepare(updateQuery).bind(newStatus, movieId).run();

	// Clear the SavedMovies table
	const clearSavedMoviesQuery = `DELETE FROM SavedMovies`;
	await db.prepare(clearSavedMoviesQuery).run();

	// Insert movies with is_saved = true into the SavedMovies table
	const insertSavedMoviesQuery = `
		INSERT INTO SavedMovies (id, title, image, production_year, image_url, meta_score, description, duration, categories, actors, director, is_saved)
		SELECT id, title, image, production_year, image_url, meta_score, description, duration, categories, actors, director, is_saved
		FROM Movies
		WHERE is_saved = true
	`;
	await db.prepare(insertSavedMoviesQuery).run();
}

export default {
	async fetch(request: Request, env: Env): Promise<Response> {
		const { pathname, searchParams } = new URL(request.url);

		// Define CORS headers
		const headers = {
			'Content-Type': 'application/json',
			'Access-Control-Allow-Origin': '*',
			'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
			'Access-Control-Allow-Headers': 'Content-Type',
		};

		if (request.method === 'OPTIONS') {
			// Handle preflight requests
			return new Response(null, { headers });
		}

		if (pathname === '/movies' && request.method === 'GET') {
			try {
				const categoryParam = searchParams.get('category');
				const searchParam = searchParams.get('search');
				const sortParam = searchParams.get('sort');

				const movies = await getAllMovies(env.DB, categoryParam, searchParam, sortParam);
				return new Response(JSON.stringify(movies), { headers });
			} catch (error) {
				return new Response('Failed to fetch movies', { status: 500, headers });
			}
		} else if (pathname.startsWith('/toggle-save') && request.method === 'POST') {
			try {
				const movieId = parseInt(searchParams.get('id') || '', 10);
				if (isNaN(movieId)) {
					return new Response('Invalid movie ID', { status: 400, headers });
				}
				await toggleSaveStatus(env.DB, movieId);
				return new Response('Save status updated successfully', { status: 200, headers });
			} catch (error) {
				return new Response('Failed to update save status', { status: 500, headers });
			}
		} else if (pathname === '/categories') {
			if (request.method === 'GET') {
				try {
					const categories = await getAllCategories(env.DB);
					return new Response(JSON.stringify(categories), { headers });
				} catch (error) {
					return new Response('Failed to fetch categories', { status: 500, headers });
				}
			}
		} else if (pathname === '/watchlist') {
			if (request.method === 'GET') {
				try {
					const savedMovies = await getAllSavedMovies(env.DB);
					return new Response(JSON.stringify(savedMovies), { headers });
				} catch (error) {
					return new Response('Failed to fetch savedMovies', { status: 500, headers });
				}
			}
		} else if (pathname.startsWith('/movie') && request.method === 'GET') {
			try {
				const movieId = parseInt(pathname.split('/')[2], 10);
				if (isNaN(movieId)) {
					return new Response('Invalid movie ID', { status: 400, headers });
				}

				const movie = await getMovieById(env.DB, movieId);
				if (!movie) {
					return new Response('Movie not found', { status: 404, headers });
				}

				return new Response(JSON.stringify(movie), { headers });
			} catch (error) {
				console.error('Error in fetch handler:', error);
				return new Response('Failed to fetch movie', { status: 500, headers });
			}
		}

		return new Response('Not Found', { status: 404, headers });
	},
} satisfies ExportedHandler<Env>;
