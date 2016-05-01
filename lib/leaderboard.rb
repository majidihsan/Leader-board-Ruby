require_relative "../spec/spec_helper"
require_relative 'team'
class Leaderboard

  attr_accessor :team

  GAME_INFO = [
    {
      home_team: "Patriots",
      away_team: "Broncos",
      home_score: 17,
      away_score: 13
    },
    {
      home_team: "Broncos",
      away_team: "Colts",
      home_score: 24,
      away_score: 7
    },
    {
      home_team: "Patriots",
      away_team: "Colts",
      home_score: 21,
      away_score: 17
    },
    {
      home_team: "Broncos",
      away_team: "Steelers",
      home_score: 11,
      away_score: 27
    },
    {
      home_team: "Steelers",
      away_team: "Patriots",
      home_score: 24,
      away_score: 31
    }
  ]
  def initialize(data = GAME_INFO)
    @data = data
    @team = []
    @team_object_array = []
  end
  def team
    GAME_INFO.each do |teams|
      @team << teams[:home_team]
      @team << teams[:away_team]
    end
    @team.uniq!
    @team.each do |name|
      @team_object_array << Team.new(name)
    end
    GAME_INFO.each do |score|
      @team_object_array.each do |team|
        if team.name == score[:home_team]
          if score[:home_score] > score[:away_score]
            team.wins += 1
          else
            team.losses += 1
          end
        elsif  team.name == score[:away_team]
          if score[:away_score] > score[:home_score]
            team.wins += 1
          else
            team.losses += 1
          end
        end
      end
    end
    @team_object_array.sort! {|a, b| a.wins <=> b.wins && a.losses <=>b.losses}
      @team_object_array.each_index do |index|
        @team_object_array[index].rank = index + 1
      end
      puts "-" * 40
      print "|Name    Rank   Toatal Wins  Total Losses|\n"
      print ''
        @team_object_array.each do |team|
          printf("|%-10s%-10d%-10d%-10d|\n", "#{team.name}", team.rank, team.wins, team.losses)
        end
      print "-" * 40
  end

  def team_game_summary(name)
    team
    total_matches = @team_object_array[0].wins + @team_object_array[0].losses
      puts "#{name} played #{total_matches} games"

    GAME_INFO.each do |match|
      home_team = match[:home_team]
      away_team = match[:away_team]
      home_score = match[:home_score]
      away_score = match[:away_score]

      if  home_score > away_score
        won = home_team
      else
        lost = home_team
      end

      if  home_score < away_score
        won = away_team
      else
        lost = away_team
      end

      if name == home_team && name == won
        puts "They Played as the home team against #{away_team} and won: #{home_score} to #{away_score} "
      elsif name == home_team && name = lost
        puts "They Played as the home team against #{away_team} and lost #{home_score} to #{away_score}"
      end

      if name == away_team && name == won
        puts "They Played as the away team against #{home_team} and won: #{away_score} to #{home_score} "

      elsif name == away_team && name == lost
        puts "They Played as the away team against #{home_team} and lost: #{away_score} to #{home_score} "
      end
    end
    ''
  end
end

leaderboard = Leaderboard.new
puts leaderboard.team
puts leaderboard.team_game_summary("Broncos")
