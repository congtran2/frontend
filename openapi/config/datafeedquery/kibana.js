module.exports = {
    apm: {
        enable: false,
        serviceName: 'DatafeedQueryServer',
        serverUrl: `${process.env.KIBANA_URL}`,
        options: {
            active: true //thêm điều kiện active của agent
        }
    }
};