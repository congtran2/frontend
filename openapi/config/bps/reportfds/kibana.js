module.exports = {
    apm: {
        enable: false,
        serviceName: 'BPSREPORTFDSServer',
        serverUrl: `${process.env.KIBANA_URL}`,
        options: {
            active: true //thêm điều kiện active của agent
        }
    }
};