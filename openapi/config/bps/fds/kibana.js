module.exports = {
    apm: {
        enable: "N",
        serviceName: 'BPSFDSServer',
        serverUrl: `${process.env.KIBANA_URL}`,
        options: {
            active: true //thêm điều kiện active của agent
        }
    }
};