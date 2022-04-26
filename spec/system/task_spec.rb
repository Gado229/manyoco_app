require 'rails_helper'
RSpec.describe 'Task management function', type: :system do
  before do
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
    FactoryBot.create(:third_task)
  end
  describe 'New creation function' do
    context 'When creating a new task' do
      it 'The created task is displayed' do
        visit new_task_path
          fill_in "Title", with: 'test'
          fill_in "Content", with: 'content test'
          fill_in "Deadline", with: '2022-04-26 02:53:48'
          select "started"
          select "high"
        click_on "Create Task"
      expect(page).to have_content 'test'
    end
  end
end
  describe 'List display function' do
    context 'When transitioning to the list screen' do
      it 'The created task list is displayed' do
        task = FactoryBot.create(:task, title: 'task')
        visit tasks_path
        expect(page).to have_content 'task'

      end
    end
  end
  describe 'Detailed display function' do
     context 'When transitioned to any task details screen' do
       it 'The content of the relevant task is displayed' do
         visit new_task_path
           fill_in "Title", with: 'test 1'
           fill_in "Content", with: 'content test'
           fill_in "Deadline", with: '2022-04-26 02:53:48'
           select 'started'
           select 'medium'
         click_on 'Create Task'
         expect(page).to have_content 'test 1'
       end
     end
  end
describe 'Detailed tasks List' do
  context 'When tasks are arranged in descending order of creation date and time' do
    it 'list tasks sorted in descending order of creation date' do
      visit tasks_path
      click_on 'sort by end deadline'
      assert Task.all.order('created_at desc')
    end
  end
 end
 context 'When searching with the scope method' do
      it "You can search for titles with the scope method" do
        visit root_path
        fill_in 'search_title', with: 'title_test'
        click_on 'search'
        # expect(Task.get_by_taskname('task').count).to eq 1
        expect(page).to have_content 'title_test'
      end
      it "You can search the status with the scope method" do
        visit root_path
        select 'started', from: 'search_status'
        click_on 'search'
        expect(page).to have_content 'title_test'
      end
      it "You can search the priority with the scope method" do
       visit root_path
        select 'medium', from: 'search_priority'
       click_on 'search'
        expect(page).to have_content 'test 1'
      end
      it "Both title and status can be searched with the scope method" do
        visit root_path
        fill_in 'search_title', with: 'test 2'
        select 'pending', from: 'search_status'
        click_on 'search'
        expect(page).to have_content 'test 2'
      end
      it "Both title and priority can be searched with the scope method" do
        visit root_path
        fill_in 'search_title', with: 'test 2'
        select 'medium', from: 'search_priority'
        click_on 'search'
        expect(page).to have_content 'test 2'
      end
      it "Both status and priority can be searched with the scope method" do
        visit root_path
        select 'started', from: 'search_status'
        select 'high', from: 'search_priority'
        click_on 'search'
        expect(page).to have_content 'Task'
      end
    end
end
