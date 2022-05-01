FactoryBot.define do
  factory :task do
    title { 'title_test' }
    content { 'content test 1' }
    deadline { DateTime.now }
    status { 0 }
    priority { 1 }
    user_id {1}
  end

  factory :second_task, class: Task do
    title { 'test 2' }
    content { 'content test 2' }
    deadline { DateTime.now +1 }
    status { 1 }
    priority { 2 }
    user_id {1}
  end

  factory :third_task, class: Task do
      title { 'task 3' }
      content { 'content test 3' }
      deadline { DateTime.now +2 }
      status { 2 }
      priority { 0 }
      user_id {1}
  end
end
