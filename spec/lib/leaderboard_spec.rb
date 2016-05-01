require 'spec_helper'
RSpec.describe Leaderboard do
  describe ".new" do
    it "creates an empty hash for 'teams'" do
      leaderboard = Leaderboard.new
      expect(leaderboard).to be_a(Leaderboard)
      # or expect(leaderboard.teams_array).to eq([])
    end
  end
  describe '#team' do
    it 'Creates team object by iterating through GAME_INFO to create team objects with only their names.
    Iterates through GAME_INFO again to set the number of wins and losses for each team
    should add a ranking to each rank instance variable of each object
    Displays the leaderboard in the terminal.' do
    leaderboard = Leaderboard.new
    expect(leaderboard.team).to be_a(Array)
    expect(leaderboard.team.count).to eq(4)
    expect(leaderboard.team_object_array.count).to eq(4)
    expect(leaderboard.team_object_array[0].wins).to be_between(0, 3).inclusive
    expect(leaderboard.teams_object_array[0].rank).to eq(1)
    leaderboard_printout =
    "----------------------------------------" +
    "|Name    Rank   Toatal Wins  Total Losses|\n" +
    "|Patriots  1         3         0         |\n" +
    "|Steelers  2         1         1         |\n" +
    "|Broncos   3         1         2         |\n" +
    "|Colts     4         0         2         |\n" +
    "----------------------------------------"
    expect(leaderboard.team).to eq(leaderboard_printout)
  end
end

describe '#team_game_summary' do
  it 'takes a parameter of a team object and prints the  details of each game that team played'do
  leaderboard = Leaderboard.new
  expect(leaderboard.team).to be_a(Array)
  expect(leaderboard.team.count).to eq(4)
  expect(leaderboard.team_object_array.count).to eq(4)
  team_game_summary_print =
  "Patriots played 3 games."
  "They played as the home team against the Broncos and won: 17 to 13."
  "They played as the home team against the Colts and won: 21 to 17."
  "They played as the away team against the Steelers and won: 31 to 24."
  expect(leaderboard.team_game_summary("Patriots")).to eq(team_game_summary_print)
    end
  end
end
