module.exports = {
    apm: {
        enable: false,
        serviceName: 'TransactionServer',
        serverUrl: `${process.env.KIBANA_URL}`,
        options: {
            active: true //thêm điều kiện active của agent
        }
    }
};