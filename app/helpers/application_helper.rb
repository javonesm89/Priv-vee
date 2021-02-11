module ApplicationHelper
    def display_savings
        link_to "YTD Savings", user_savings_path(@user) 
    end

    def is_logged_in?
        binding.pry
    end
end
