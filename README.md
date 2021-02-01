![](https://img.shields.io/badge/Microverse-blueviolet)

# Capstone Project: Ruby: Web Scraper
> An `application` designed to scrap the web and retrieve information from  movie websites, such as the movie title, it's quality, year of release, download link etc, it retrieves data from movie websites like [Gostream](https://gostream.site/).

![screenshot]()

Web scraping is the process of using bots to extract content and data from a website. Unlike screen scraping, which only copies pixels displayed onscreen, web scraping extracts underlying HTML code and, with it, data stored in a database. The scraper can then replicate entire website content elsewhere.

## Documentation

I don't know about you, but I have always wanted to surf the web and download movies or other public data freely without being annoyed by those pop-ups and ads from the internet. I'm glad I can do that now with this Web scraper that I've created using Ruby programming language and few Gems.
This application was designed to simplify the process of retrieving movie information from a website and then display it in your terminal or command prompt. And then you decide if you want to download it or stream it, giving you the direct link to accomplish the task.
This tool is very easy to use, please follow the instructions bellow to install it and enjoy scraping the web :D.

> If you are on *repl.it*, **please click [here](https://repl.it/@ixboy/webscraper#README.md)**.

## Built With
- [Ruby](https://www.ruby-lang.org/en/)
- [Gems](https://rubygems.org/)
  - [Nokogiri](https://nokogiri.org/)
  - [HTTParty](https://github.com/jnunemaker/httparty)
  - [Rspec](https://rspec.info/)
  - [colorize](https://github.com/fazibear/colorize)

  ## Live Demo
[![Run on Repl.it](https://github.com/ixboy/web_scraper/tree/feature/scraper)](https://repl.it/@ixboy/webscraper#README.md)
 > click [here](https://repl.it/@ixboy/webscraper#README.md)**.

## Getting Started
You have two options for using this program: running it locally or running it from the live demo.

### Preparing the local environment
For running this program locally, you need to:
- [Install Ruby](https://www.ruby-lang.org/en/downloads/)
- [Install git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

> Note: as discussed below, downloading the source code without `git` is possible.

Once Ruby is installed, get a copy of this project by:
- Cloning the repository using `git`
  * `git clone https://github.com/ixboy/web_scraper.git`
- Downloading a zip with the source code
  * Click [here](https://github.com/ixboy/web_scraper/archive/feature/scraper.zip)
  * Once  downloaded, extract it in a place with easy access to a terminal

Once Ruby is installed, and you have a copy of the source code, open the terminal and navigate to the folder where the code is:
- For Windows users, check [this](https://www.technoloxy.com/tutorials/cmd-navigate-view-run/) article.
- For UNIX/UNIX-like users such as Linux and macOS users, check [this](https://swcarpentry.github.io/shell-novice/02-filedir/index.html) article.

Install the Gems by running `bundle install`. You may need to provide your user password. For more information about Ruby's `bundle`, check [here](https://bundler.io/man/bundle-install.1.html).


- From the root directory(Web_Scraper), change directory into the bin directory by running the following command and start using the tool...

 * `ruby bin/scraper.rb`


### Preparing *repl.it*
If you are running this program inside the live demo:
- Click the green `Run` button centered at the top
- Verify that the output shows no errors
- Click the `Shell` tab in the right panel

> The `Run` button will install any missing Gem and run a default demo command. For the interactive view **use the Shell tab, because the Console view does not display it correctly**.

### Running
By following the steps in either the live demo or in the local environment, you should execute the program smoothly...

## Authors

👤 **Iyunda Ismael Antonio**

- GitHub: [@ixboy](https://github.com/ixboy)
- Twitter: [@ismaelixboy](https://twitter.com/ismaelixboy)
- LinkedIn: [ismael-antonio](https://www.linkedin.com/in/ismael-antonio-0b7712114/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/ixboy/web_scraper/issues).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](https://opensource.org/licenses/MIT) licensed.
