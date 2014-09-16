#!/usr/bin/env ruby

require "set"
require "minitest/autorun"
require_relative "../lib/paradox"

class ParadoxModFileTest < MiniTest::Test
  def test_to_h
    str = ParadoxModFile.new(string: "
      government = merchant_republic
      mercantilism = 0.25
      primary_culture = lombard
      religion = catholic
      add_accepted_culture = greek
      add_accepted_culture = croatian
      technology_group = western
      capital = 112 # Venezia
      historical_friend = KNI
      historical_friend = HAB
    ").parse!
    assert_equal({
      "government"           => "merchant_republic",
      "mercantilism"         => 0.25,
      "primary_culture"      => "lombard",
      "religion"             => "catholic",
      "add_accepted_culture" => ["greek", "croatian"],
      "technology_group"     => "western",
      "capital"              => 112,
      "historical_friend"    => ["KNI", "HAB"],
    }, str.to_h)
  end

  def test_normalize
    str1 = ParadoxModFile.new(string: "
      government = merchant_republic
      mercantilism = 0.25
      primary_culture = lombard
      religion = catholic
      add_accepted_culture = greek
      add_accepted_culture = croatian
      technology_group = western
      capital = 112 # Venezia
      historical_friend = KNI
      historical_friend = HAB
    ").parse!
    str2 = ParadoxModFile.new(string: "
      government = merchant_republic
      add_accepted_culture = croatian
      mercantilism = 0.25
      technology_group = western
      primary_culture = lombard
      religion = catholic
      add_accepted_culture = greek
      capital = 112 # Venezia
      historical_friend = HAB
      historical_friend = KNI
    ").parse!
    assert(str1 != str2)
    assert_equal(str1.normalize, str2.normalize)
  end

  def test_work_as_part_of_set
    set = Set[]
    set << PropertyList["test", 2.0]
    set << PropertyList["test", 2]
    set << PropertyList["test", 2.0]
    set << PropertyList[]
    set << PropertyList["what", 10, "is", "this"]
    set << PropertyList["what", true, "is", PropertyList["this", 15]]
    set << PropertyList["what", true, "is", PropertyList["this", 15]]
    set << PropertyList["what", true, "is", PropertyList["that", 15]]
    assert_equal([
      PropertyList["test", 2.0],
      PropertyList["test", 2],
      PropertyList[],
      PropertyList["what", 10, "is", "this"],
      PropertyList["what", true, "is", PropertyList["this", 15]],
      PropertyList["what", true, "is", PropertyList["that", 15]],
    ], set.to_a)
  end
end
