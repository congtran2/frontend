
/**
 * Production environment settings
 * (sails.config.*)
 *
 * What you see below is a quick outline of the built-in settings you need
 * to configure your Sails app for production.  The configuration in this file
 * is only used in your production environment, i.e. when you lift your app using:
 *
 * ```
 * NODE_ENV=production node app
 * ```
 *
 * > If you're using git as a version control solution for your Sails app,
 * > this file WILL BE COMMITTED to your repository by default, unless you add
 * > it to your .gitignore file.  If your repository will be publicly viewable,
 * > don't add private/sensitive data (like API secrets / db passwords) to this file!
 *
 * For more best practices and tips, see:
 * https://sailsjs.com/docs/concepts/deployment
 */
//================================================
// Hà tự Sửa thành bộ config của ekyc
//================================================
const Redis = require('ioredis');
const redisOptions = {
    host: `tools_cache-redis-master`,
    port: `6379`,
    name: "mymaster"
};
const redisClient = new Redis(redisOptions);
module.exports = {
    serverapp: {
        URL_RESOURCE: `http://fedmz_sso:1347/`, //link sso server
        bpsUrl: `http://bps_haproxy/bpsbase`, //link BPSService
        datafeedUrl: `http://fedmz_datafeedquery:13351`, //link server datafeedquery
        serviceUrl: `http://tools_bps_haproxy/external`,
        bpsUploadUrl: `http://bps_haproxy/bpsbase`, //link BPS upload
        tranUrl: `http://fedmz_transaction:1340`, // link trans
        ekycProviderUrl: `${process.env.EKYC_ENDPOINT}`, //link ekyc
        esignService: `${process.env.ESIGN_SERVICE_URL}`,
    },
    captcha: {
        SECRET_KEY: "6Ld2pR0nAAAAAHTRqcmXxsWVK8ref0pH9Yc1BoO-",
        SITE_KEY: "6Ld2pR0nAAAAAEIg7iEnycUNkx4wS1yzGaJ83LHZ",
        URL_VERIFY: "https://google.com/recaptcha/api/siteverify"
    },
ekyc: { //token
        TOKEN_ID: 'cf677413-a4a6-35aa-e053-62199f0a934f',
        TOKEN_KEY: 'MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAM5Fq/IpXhKqw0Ummp1UMs2M1KH4YJJ+zg2Dy3dI48OaFRDgwqSLsJng4KyReSDi/pylYFDL9lR1VqSmB29+HW0CAwEAAQ==',
        AUTHORIZATION: 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI5MjAwZmEzZC0zN2QyLTExZWMtYTEzNy0xZGYxN2RlYmQyNzkiLCJhdWQiOlsicmVzdHNlcnZpY2UiXSwidXNlcl9uYW1lIjoiYWRtaW5AZHNjLmNvbS52biIsInNjb3BlIjpbInJlYWQiXSwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3QiLCJuYW1lIjoiYWRtaW5AZHNjLmNvbS52biIsInV1aWRfYWNjb3VudCI6IjkyMDBmYTNkLTM3ZDItMTFlYy1hMTM3LTFkZjE3ZGViZDI3OSIsImF1dGhvcml0aWVzIjpbIlVTRVIiXSwianRpIjoiNmJlODk3YTktMzJhOS00YjhhLTk4ZWItMWE3YWQ4MGZkM2E3IiwiY2xpZW50X2lkIjoiYWRtaW5hcHAifQ.HoIECREIjvfsydLfKiA6WkvCYSC-Uij_O5tEpkyw1tIOKpz75NOQ_YPuUzTJCw7kwZDDXB1HVxNTGhT_KPXQlIgSqT4m1BLRA51CnsSS-Sl-m0MVyz7nahslbzuZ1lQTqu1xv8teJkvC5gxlUMQEfjG8bnTPI4cxUhFZVpdabURlMyBukUJkq02kEubaOf2OxWs4cv8YzQGqIM0GHIg-snZsqEXZfdjt0-QTTjqfYatBapVUueXrHVm4agRvLTk5oev9GzcpWW-5Gs_YQsvWt1E-mpp1PYzplErcn3RbfClWQyTF5xKJBJc4LDhOJW6cxGTrhDFnVWvZUw2PM8CRGw'

    },

    session: {
        adapter: "connect-redis",
        client: redisClient,
        db: 4
    },
    redisStore: {
        host: `tools_cache-redis-master`,
        port: `6379`,
        db: 5
    },
    ssoModelStore: {
        host: `tools_cache-redis-master`,
        port: `6379`,
        db: 2
    },
    internalPubsub: {
        host: `tools_cache-redis-master`,
        port: `6379`,
    },
    port: process.env.EKYC_PORT || 1348,
};