# Overview

To learn how to write programs in the swift language, I chose to write a simple console-based weather application. It will take user input to display the weather for a selected city anywhere in the world in the preferred unit of measurement.

I chose to write this software to increase my understanding of how to write in the swift language as well as gain some experience calling APIs.

[Weather Application Demonstration](https://youtu.be/W4YZgcngfr8)

# Development Environment

My main tool was Xcode, the IDE that I used to write the language. I also used the openweathermap.org API for all of my weather data requests. Alongside debugging step by step, I used grok (Xs' LLM text generative AI) to help learn much of the syntax for the swift language.

I used the swift language with the "foundation" framework to write this program.

# Useful Websites

- [Stack Overflow Forums](https://stackoverflow.com/questions/35519480/swift-get-user-input-with-prompt)
- [OpenWeather (How to start using APIs)](https://openweathermap.org/appid)
- [Swift-30-Projects by soapyigu](https://github.com/soapyigu/Swift-30-Projects)
- [Grok AI (by xAI)](https://grok.com)

# Future Work

- Recieve GPS location from the user's device and provide weather for current location
- Show the user a 5-10 day forecast into the future for weather at the selected location
- Include a graphical UI for the application
- Add a visual map that shows the weather for various locations

# Additional Note

To run this program yourself, you will need to create a free account with openweathermap.org and obtain an API key. You can then place that API key in the "WeatherService.apiKey" value to retrieve weather data from the API yourself.
