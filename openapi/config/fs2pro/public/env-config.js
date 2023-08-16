const REACT_APP_BASE_URL = `http://10.111.109.64`
const REACT_APP_REDIRECT_URL = `http://10.111.109.64/fs2pro/sso`
const CLIENT_ID = 'HZ4UAE61G3'
const CLIENT_SECRET = 'hRMjJIuLgumLADHLDakVI88zrZYq9D'
// id GoogleAnalytics
const ID_GA = null

window._env_ = {
    api: {
        // local ? /fs2pro/ : '/pathname/'
        HOME_PAGE: '/fs2pro',
        API_BASE_URL: `${REACT_APP_BASE_URL}/`,
        API_MARKET_URL: `${REACT_APP_BASE_URL}`,

        // Lấy config symbol tradingview
        API_CHART_DATA_URL: `${REACT_APP_BASE_URL}/tvchart`,

        // History tradingview
        API_NEWS_SERVICE: `${REACT_APP_BASE_URL}/tvchart`,

        CLIENT_ID: `${CLIENT_ID}`,
        CLIENT_SECRET: `${CLIENT_SECRET}`,
        REDIRECT_URL: `${REACT_APP_REDIRECT_URL}`,
        // api lấy Thông tin các tin tức theo mã CK tab tin tức
        API_MARKET_NEWS_BY_SYMBOL: `${REACT_APP_BASE_URL}/newsmarket/news/allTopNews?`,
        // api lấy Thông tin các tin tức theo mã CK tab sự kiện
        API_MARKET_EVENT_BY_SYMBOL: `${REACT_APP_BASE_URL}/newsmarket/event/allStockEvent?`,


        //api lấy tin tức theo mã CK
        API_MARKET_NOTIFICATION_BY_SYMBOL: `${REACT_APP_BASE_URL}/newsmarket/tvchart`,
        // api lấy Thông tin cho Thông tin thị trường
        API_MARKET_NOTIFICATION: `${REACT_APP_BASE_URL}/newsmarket/news/topNewsAll?`,
        // api lấy Thông tin các tin tức theo nhóm
        API_MARKET_NOTIFICATION_BY_GROUP: `${REACT_APP_BASE_URL}/newsmarket/news/topNewsByCat?`,
        // api lấy chi tiết thông tin bằng id thông tin
        API_MARKET_NOTIFICATION_DETAIL: `${REACT_APP_BASE_URL}/newsmarket/news/newsDetails?`
    },
    app: {
        // local ? null : 'pathname/'
        ROUTER_BASE_NAME: 'fs2pro/',
        //Mode login  'local' | true
        IS_LOGIN_POPUP: true
    },
    idGA: ID_GA,
    enableLog: false // log browser
}
