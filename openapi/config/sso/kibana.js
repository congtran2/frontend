module.exports = {
    apm: {
        enable: false,
        serviceName: 'SSOServer',
        serverUrl: `${process.env.KIBANA_URL}`,
        options: {
            active: true //thêm điều kiện active của agent
        }
    }
};