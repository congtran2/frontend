const GA_id = window._env_ && window._env_.idGA ? window._env_.idGA : null

if (GA_id) {
    let GaEmbed = document.createElement('script');
    GaEmbed.id = 'ga-embed'
    GaEmbed.src = `https://www.googletagmanager.com/gtag/js?id=${GA_id}`;
    GaEmbed.async = true;
    document.head.appendChild(GaEmbed);

    window.dataLayer = window.dataLayer || [];
    function gtag() { dataLayer.push(arguments); }
    gtag('js', new Date());

    gtag('config', `${GA_id}`);
}