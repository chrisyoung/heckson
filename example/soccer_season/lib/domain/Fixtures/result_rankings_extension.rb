module SoccerSeason
  module Domain
    module Fixtures
      module ResultRankingsExtension
        def initialize(group_attributes)
          super
          lookup_teams
          calculate_rankings
          set_winner_and_looser
        end

        private

        attr_reader :rankings, :teams

        def set_winner_and_looser
          @winner = teams.find {|team| team.name == rankings[0][1]}
          @loser = teams.find {|team| team.name == rankings[1][1]}
        end

        def lookup_teams
          @teams = goals.map do |goal|
            result = Teams::Repository.read(
              Players::Repository.read(goal.player.id).team.id
            )
          end
        end

        def calculate_rankings
          @rankings = teams.group_by {|a| a.name}
            .inject(Hash.new(0)) do |h,v|
              h[v[1].count] = v[0];h
            end.sort.reverse
        end
      end

      class Result
        prepend ResultRankingsExtension
      end
    end
  end
end
