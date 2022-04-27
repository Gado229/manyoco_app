class Task < ApplicationRecord
  validates :title, :content, null:false, presence: true, length: { minimum: 1 }

  enum status: {
                started: 0,
                pending: 1,
                completed: 2
                }
  enum priority: {
                  low: 0,
                  medium: 1,
                  high: 2
                  }
      scope :ordered, -> { order(created_at: :desc) }
      scope :orderByDeadline, -> {order(deadline: :desc) }
      scope :orderByPriority, -> {order(priority: :desc) }
      scope :status_sort, -> (search_status){ where(status: search_status) }
      scope :search_sort, -> (search_word){ where('title LIKE ?', "%#{search_word}%") }
      scope :priority_sort, -> (search_priority){ where(priority: search_priority) }
      scope :sort_expired, -> { order(deadline: :desc) }
      # kaminari関連
      scope :kaminari, -> (kaminari_page){ page(kaminari_page).per(5) }
      scope :current_user_sort,->(current_user_id){where(user_id: current_user_id)}
end
