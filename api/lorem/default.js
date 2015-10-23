module.exports = {
    '/api/lorem': {
        GET: {
            data: [
                { name: 'John' },
                { name: 'Adam' }
            ],
            timeout: 100
        },
        POST: {
            data: {
                success: true
            },
            code: 201
        }
    }
};