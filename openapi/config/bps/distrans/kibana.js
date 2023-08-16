module.exports = {
    apm: {
        enable: "N",
        serviceName: 'BPSTransServer',
        serverUrl: `${process.env.KIBANA_URL}`,
        options: {
            active: true //thêm điều kiện active của agent
        }
    }
};