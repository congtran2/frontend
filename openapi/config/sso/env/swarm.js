/**
 * Development environment settings
 *
 * This file can include shared settings for a development team,
 * such as API keys or remote database passwords.  If you're using
 * a version control solution for your Sails app, this file will
 * be committed to your repository unless you add it to your .gitignore
 * file.  If your repository will be publicly viewable, don't add
 * any private information to this file!
 *
 */
const now = Date.now();
const Redis = require('ioredis');
const redisClient = new Redis({
    host: `tools_cache-redis-master`,
    port: `6379`,
    
    name: "mymaster"
});

module.exports = {
    //enableFDS: true,
    enableMD5: true,
    oauth: {
        tokenShortLife: 3 * 60 * 60 // seconds
    },
    port: process.env.SSO_PORT || 1347,
    session: {  // thông tin redis session
        adapter: "connect-redis",
        client: redisClient,
        db: 1
    },
    datastores: {  // thông tin redis database chứa các dữ liệu persistent
        default: {
            url: `postgresql://postgres:postgres@tools_postgresql:5432/sso`
        },
    },
    ADMIN_USERNAME: 'ADMIN',
    CHANGEPASS_SERVER: '',    // server change pass
    USERNAME_PREFIX: '116C',
    enableRolloutLimit: false,
    SINGLE_SESSION_LOGIN: false,	
    forwardedHeader: "client-ip",
    rabbitmq: {     // thông tin rabbitmq để nhận tín hiệu thay đổi số dư, thay đổi trạng thái lệnh ... từ database oracle
        rabbitmqHost: `amqp://bus:bus1234@tools_rabbitmq:5672`,
    },
    kafkaConfig: {  // config thông số kafka
        brokers: `${process.env.KafkaUrl}`,
    },
    INTERNAL_ADDRESS: ['127.0.0.1', '::ffff:127.0.0.1'],
    signServer: {
        pluginUrlChrome: 'http://localhost:11368/',
        pluginUrlNotChrome: 'https://localhost:11369/'
    },
    serverapp: {
        userDataUrl: `http://fedmz_persistent:1341`,
        externalServiceUrl: `http://tools_bps_haproxy/external`,
        bpsUrl: `http://tools_bps_haproxy/bpsbase`, //link BPSService
        bpsFDSUrl: `http://tools_bps_haproxy/bpsfds`, //link BPSService FDS
        SIGN_SERVER: `${process.env.SIGNSERVER_URL}`,//address of signature server
        totpUrl: `${process.env.TOTP_ENDPOINT}` // link to Smart OTP
    },
    ssoModelStore: {
        host: `tools_cache-redis-master`,
        port: `6379`,
    },
    redisStore: {
        host: `tools_cache-redis-master`,
        port: `6379`,
    },
    internalPubsub: {
        host: `tools_cache-redis-pubsub`,
        port: `6379`,
    },
};
