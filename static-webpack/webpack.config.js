const webpack = require("webpack");
const HtmlWebpackPlugin = require("html-webpack-plugin");
const path = require("path");

module.exports = {
  entry: "./src/index.js",
  output: {
    path: path.resolve(__dirname, "dist"),
    filename: "main.js"
  },
  plugins: [
    new webpack.EnvironmentPlugin(["BUNDLER"]),
    new HtmlWebpackPlugin({
      title: "webpack App",
      template: "src/index.html"
    })
  ]
};
