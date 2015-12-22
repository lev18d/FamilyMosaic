module HistoriesHelper
  def find_histories
    cur_history = History.find_by_family_id(current_user.profile.family_id)
    if cur_history
      puts "1"
      return cur_history
    else
      puts "2"
      return nil
    end
  end

end
