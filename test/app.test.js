const request = require('supertest');
const app = require('../app');

describe('GET /', () => {
  it('returns Hello World! with HTTP 200', async () => {
    const response = await request(app).get('/');

    expect(response.status).toBe(200);
    expect(response.text).toBe('Hello World!');
  });
});
