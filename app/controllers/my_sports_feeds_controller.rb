class MySportsFeedsController < ApplicationController

  def index
    msf = MySportsFeeds.new(version="1.0", true)
    msf.authenticate("bschwartz92", "brettschwartz")
    data = msf.msf_get_data('nfl', '2015-2016-regular', 'cumulative_player_stats', 'xml', 'team' => 'dallas-cowboys')
  end

end
