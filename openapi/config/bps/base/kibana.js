module.exports = {
    apm: {
        enable: "N",
        serviceName: 'BPSBaseServer',
        serverUrl: `${process.env.KIBANA_URL}`,
        options: {
            active: true //thêm điều kiện active của agent
        }
    }
};