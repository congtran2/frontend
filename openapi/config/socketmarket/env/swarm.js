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

const redisPubClient = new Redis(redisOptions);

const redisSubClient = new Redis(redisOptions);

const redisPubAdminClient = new Redis(redisOptions);

const redisSubAdminClient = new Redis(redisOptions);
module.exports = {
    session: { // thông tin redis session
        adapter: "connect-redis",
        client: redisClient,
        db: 4
    },

    // sockets: { // thông tin redis socket
    //     pubClient: redisPubClient,
    //     subClient: redisSubClient,
    //     adminPubClient: redisPubAdminClient,
    //     adminSubClient: redisSubAdminClient,
    //     subEvent: "messageBuffer",
    //     db: 4
    // },
    sockets: { // thông tin redis socket
        url: `redis://tools_cache-redis-market:6379/4`,
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
    serverapp: {
        bpsUrl: `http://tools_bps_haproxy/bpsbase`, //link BPSService
        ssoUrl: `http://fedmz_sso:1347`,    // thông tin sso server để check clientid và clientsecret
        datafeedUrl: `http://fedmz_datafeedquery:13351`,   // thông tin datafeed server để publish giá
        rabbitmq: {     // thông tin rabbitmq để nhận tín hiệu thay đổi số dư, thay đổi trạng thái lệnh ... từ database oracle
            rabbitmqHost: `amqp://bus:bus1234@tools_rabbitmq:5672`,
        }
    },
    port: process.env.SOCKET_PORT || 1336,
    enableBroker: true,
};