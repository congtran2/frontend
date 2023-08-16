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
        bpsUrl: `http://tools_bps_haproxy/bpsreport`, //link BPSService
        bpsFDSUrl: 'http://tools_bps_haproxy/bpsfds', //link BPSService FDS
        bpsBrokerUrl: `http://tools_bps_haproxy/bpsreportbroker`, //link BPSService report moi gioi
        bpsActiveUrl: `http://tools_bps_haproxy/bpsbase`, //link BPSService active
        datafeedUrl: `http://fedmz_datafeedquery:13351`, //link server datafeed
        tradingUrl: `http://fedmz_trading:1337`, //link server trading
        ExternalServiceUrl: `http://tools_bps_haproxy/external`, //link server external
    },
    ftp: {
        host: `${process.env.FTP_IP}`,
        username: `${process.env.FTP_USER}`,
        password: `${process.env.FTP_PASS}`,
        options: {
            timeout: 15000,
        }
    },
    redisStore: {
        host: `tools_cache-redis-master`,
        port: `6379`
    },
    ssoModelStore: {
        host: `tools_cache-redis-master`,
        port: `6379`
    },
    internalPubsub: {
        host: `tools_cache-redis-pubsub`,
        port: `6379`,
    },
    session: {
        adapter: "connect-redis",
        client: redisClient,
        db: 2
    },
    enableBroker: true,
    enableFDS: false,
    port: process.env.REPORT_PORT || 13381,
};
