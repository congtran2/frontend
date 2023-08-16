module.exports = {
    port: 4000,
    ADMIN_USERNAME: 'GIOINH', // Config tài khoản admin được phép quản lý client, permission, đồng bộ dữ liệu
    serverapp: {
        ssoUrl: `http://fedmz_sso:${process.env.SSO_PORT || 1347}`,    // thông tin sso server để check clientid và clientsecret
        notificationUrl: `http://fedmz_notification:${process.env.NOTIFICATION_PORT || 1345}`,
        userDataUrl: `http://fedmz-persistent:1341`,
        bpsUrl: 'http://tools_bps_haproxy/bpsbase'
    },
    redisStore: {
        host: "tools_cache-redis-master",
    },
    ssoModelStore: {
        host: "tools_cache-redis-master",
    },
    redisDB: {
        WebAdmin: 2,
    },
}