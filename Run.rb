=begin
Name: The Virus Loop
Version: 0.1  |            hh:mm:ss
Created: 2/10(Friday)/2017 11:45:45
=end

#load Files
$: << File.dirname(__FILE__)
#/load Files

#Gems
require 'gosu'
require 'rubygems'

include Gosu
#/Gems

#Scripts
require "scripts/GameWindow.rb"
require "scripts/Player.rb"
require "scripts/SceneMap.rb"
#/Scripts

#Window
$window = GameWindow.new
$window.show
#/Window
