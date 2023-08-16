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
    enableFDS: true,
    port: 1345,                 FirebaseKey:"AAAA75KFUL4:APA91bHT_Yh0HPFnzzOW0xnMcj_SHNyGBE-tBiux4NjNiqw0kNmbssYzt_TBzRK81-gmmIzbsekITKPKcezBfye2Nw5VAZyoPpIdT86mpnEllEysWmxf7gKwRow4PwqMG7Nj5NDg2Ton",
    MsgtypeS_Rbmq: {  // public tin hieu thi truong cho cac service khac
        rabbitmqHost: 'amqp://bus:bus1234@tools_rabbitmq:5672',
        MsgtypeSExchangeType: 'fanout',
        MsgtypeSExchangeProps: { durable: true, autoDelete: false, internal: false },

        MsgtypeSExchangeName: 'MessageTypeS_Exchange',
        MsgtypeSEventQueue: 'notification.msgtypes',
    },
    serverapp: {
        bpsUrl: `http://tools_bps_haproxy/bpsbase`, //link BPSService
        bpsFDSUrl: `http://tools_bps_haproxy/bpsfds`, //link BPSService FDS
        ssoUrl: `http://fedmz_sso:1347`,    // thông tin sso server để check clientid và clientsecret
        datafeedUrl: `http://fedmz_datafeedquery:13351`,
    },
    MarketDataInternal_Rbmq: {  // public tin hieu thi truong cho cac service khac
        rabbitmqHost: `amqp://bus:bus1234@${process.env.MARKETDATA_IP}:5672`,
    },
    kafkaConfig: {  // config thông số kafka
        brokers: `${process.env.KafkaUrl}`,
    },
    session: {
        adapter: "connect-redis",
        client: redisClient,
        db: 4,
    },
    // sockets: {
    //     pubClient: redisPubClient,
    //     subClient: redisSubClient,
    //     adminPubClient: redisPubAdminClient,
    //     adminSubClient: redisSubAdminClient,
    //     subEvent: "messageBuffer",
    //     db: 0
    // },
    sockets: { // thông tin redis socket
        url: `redis://tools_cache-redis-socket:6379/4`,
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
    datastores: {
        default: {
            url: `postgresql://postgres:postgres@tools_postgresql:5432/notification`,
            max: 10,
            min: 5
        },
    },
    ftp: {
        host: `${process.env.FTP_IP}`,
        username: `${process.env.FTP_USER}`,
        password: `${process.env.FTP_PASS}`,
    },
    internalPubsub: {
        host: `tools_cache-redis-pubsub`,
        port: `6379`
    }

}
