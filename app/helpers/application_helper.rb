module ApplicationHelper
    def display_savings
        link_to "YTD Savings", user_savings_path(@user) 
    end

    def signup
    end
end
