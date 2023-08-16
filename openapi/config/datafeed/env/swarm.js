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

module.exports = {
    blueprints: {
        actions: true
    },
    enablePublishSocket: true,  // enable việc publish giá vào redis pubsub
    enableTraceLogDatafeed: true,   // enable ghi log count số message nhận được từ adapter

    // sockets: {
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
    datastores: {
        default: {
            url: `postgresql://postgres:postgres@tools_postgresql:5432/jdatafeed`,
            max: 2,
            min: 1,
        },
    },
    serverapp: {
        bpsUrl: 'http://tools_bps_haproxy/bpsbase', //link BPSService
        rabbitmq: {     // thông tin rabbitmq để nhận tín hiệu thay đổi số dư, thay đổi trạng thái lệnh ... từ database oracle
            rabbitmqHost: `amqp://bus:bus1234@tools_rabbitmq:5672`,
        },
        MarketData_Rbmq: {
            rabbitmqHost: `amqp://bus:bus1234@${process.env.MARKETDATA_IP}:5672`,
        },
        MarketDataInternal_Rbmq: {  // public tin hieu thi truong cho cac service khac
            rabbitmqHost: `amqp://bus:bus1234@${process.env.MARKETDATA_IP}:5672`,
        }
    },
    port: process.env.DATAFEEDPERSIST_PORT || 1335,
    intervals: {
        syncIndexchartInDay: 24 * 60 * 60 * 1000,
        syncInstrumentChartInDay: 24 * 60 * 60 * 1000,
    }
};