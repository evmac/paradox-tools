module ModernTimes
  module Dates
    # Easy dates
    @dates = {
      start: "1900.1.1",
      title_holders_until: "2020.12.31", # how far to generate title holders
      end_of_times: "9999.12.31", # Just for some calculations, not used in the mod itself
      ireland_independence: "1921.12.6",
      cyprus_independence: "1960.10.1",
      malta_independence: "1964.9.21",
      sri_lanka_independence: "1948.2.4",
      maldives_independence: "1965.7.26",
      india_independence: "1947.8.15",
      bangladesh_independence: "1971.12.16",
      goa_annexation: "1961.12.19",
      iceland_independence: "1944.6.17",
      norway_independence: "1905.6.7",
      finland_independence: "1917.12.6",
      czechoslovakia_independence: "1918.10.28",
      czechoslovakia_dissolution: "1993.1.1",
      south_tirol_annexation: "1920.10.10",
      anschluss: "1938.3.12",
      north_cyprus_invasion: "1974.8.18",

      algeria_indepnedence: "1962.4.8",
      tunisia_independence: "1956.3.20",
      libya_italian: "1912.10.18", # First Treaty of Lausanne
      libya_independence: "1951.12.24",
      egypt_independence: "1922.2.28",

      jordan_independence: "1946.6.17",
      syria_independence: "1946.4.17",
      lebanon_independence: "1943.11.22",
      israel_independence: "1948.5.14",
      six_day_war: "1967.6.10",
      egypt_israel_peace: "1979.3.26",

      # TODO: models both Balkan Wars properly
      treaty_of_london: "1913.5.30", # First Balkan Wars
      treaty_of_bucharest: "1913.10.10", # Second Balkan Wars

      kuwait_independence: "1961.6.19",
      bahrain_independence: "1971.8.15",
      british_iraq: "1920.4.25",
      iraq_independence: "1932.10.3",

      # There were a lot of peace treaties but it's easier to just do it in one go, at least for now
      end_ww1: "1918.11.11",
      end_ww2: "1945.5.8",
      german_reunification: "1990.9.29",
      silesian_uprising: "1922.5.15", # actually Geneva convension for Upper Silesia

      annexation_latvia: "1940.8.5",
      annexation_lithuania: "1940.8.3",
      annexation_estonia: "1940.8.6",
      annexation_armenia: "1920.12.2",
      annexation_azerbaijan: "1920.5.11",
      annexation_georgia: "1921.3.17",
      soviet_partition_of_romania: "1940.7.4",
      fall_soviet_union: "1991.12.26",
      crimea_invasion: "2014.4.17",

      treaty_of_sevres: "1920.8.10",
      treaty_of_ankara: "1921.10.20",
      treaty_of_lausanne: "1923.7.24",

      slovenia_independence: "1991.7.7",
      croatia_independence: "1991.10.8",
      bosnia_independence: "1993.3.3",
      montenegro_serbian: "1918.12.1",
      montenegro_independence: "2006.6.3",

      albania_italian: "1939.4.12",
      macedonia_independence: "1991.9.8",

      mongolia_independence: "1924.11.26",

      north_yemen_independence: "1918.10.30",
      south_yemen_independence: "1967.11.30",
      yemen_unification: "1990.5.22",
      djibouti_independence: "1977.6.27",
      mali_independence: "1960.6.20",
      mauritania_french: "1903.5.12", # Was under French influence earlier
      mauritania_independence: "1960.11.28",
      sudan_independence: "1956.1.1",

      eritrea_british: "1941.4.1", # Battle of Keren; or I could make it formal at end of WW2
      eritrea_ethiopian: "1950.12.2",
      eritrea_independence: "1993.5.24",
      somalia_independence: "1960.7.1",

      morocco_protectorate: "1912.3.30", # sp/fr
      north_spanish_morocco_end: "1958.4.1",
      # south_spanish_morocco_end: "1956.4.7", # Too small to matter on the map probably
      french_morocco_independence: "1956.10.29",
      madrid_accords: "1975.11.14",

      oman_independence: "1970.7.23", # Not sure this is corrrect date

      caliphate_reborn: "2014.6.29",
    }

    def self.[](date)
      case date
      when nil
        nil
      when :never
        :never # Magic placeholder, maybe fix them someday
      when Date
        date
      when String
        if date =~ /\A\d{4}\z/
          Date.parse("#{date}.1.1")
        else
          Date.parse(date)
        end
      when Symbol
        raise "No date #{date.inspect}" unless @dates[date]
        Date.parse(@dates[date])
      else
        raise
      end
    end
  end
end