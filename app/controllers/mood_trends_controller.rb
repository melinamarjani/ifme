# frozen_string_literal: true
class MoodTrendsController < ApplicationController
  def index
    render json: {
      mood_data: [
        { date: '2025-06-01', mood: 'happy', count: 2 },
        { date: '2025-06-02', mood: 'sad', count: 1 },
        { date: '2025-06-03', mood: 'anxious', count: 3 }
      ]
    }
  end
end
