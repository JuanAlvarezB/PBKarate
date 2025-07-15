function fn(){

const config = {
baseUrl: karate.properties['baseUrl'],
baseUrlDos: karate.properties['baseUrlDos']
}

var baseUrl = karate.properties['baseUrl']
karate.log('baseUrl is: ', baseUrl);

var baseUrlDos = karate.properties['baseUrlDos']
karate.log('baseUrlDos is: ', baseUrlDos);


karate.configure('connectTimeout', 30000);
karate.configure('readTimeout', 30000);
karate.configure('ssl', true);

return config;


}