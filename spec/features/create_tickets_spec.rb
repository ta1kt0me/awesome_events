require 'rails_helper'

describe 'ユーザーがイベントさんか表明をする', js: true do
  let!(:event) { create(:event) }

  context 'ログインユーザーが、イベント詳細ページで"参加する"をクリックしたとき' do
    before do
      visit root_path
      click_link 'Twitterでログイン'
      page.save_screenshot('/tmp/logged_in.png')
      p event
      visit event_path(event.id)
      page.save_screenshot('/tmp/file.png')
      click_on '参加する'
    end

    it 'コメント入力用のモーダルウインドウが表示されていること' do
      expect(page.find('#CreateTickets')).to be_visible
    end

    context 'かつ、コメントを入力し"送信"ボタンをおしたとき' do
      before do
        fill_in 'ticket_comment', with: '参加します!'
        click_button '送信'
      end

      it '"このイベントに参加表明しました"と表示されていること' do
        expect(page).to have_content('このイベントに参加表明しました')
      end

      it '参加表明したユーザー名が表示されていること' do
        expect(page).to have_content('@tokutomi')
      end
    end
  end
end
feature "CreateTickets", :type => :feature do
  
end
