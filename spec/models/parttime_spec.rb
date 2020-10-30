require 'rails_helper'
describe Parttime do
  before do
    @parttime = FactoryBot.build(:parttime)
  end

  describe 'シフト情報新規登録' do
    context '新規登録がうまくいくとき' do
      it '記入必須項目が全て入力されていれば登録できる' do
        expect(@parttime).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'pr_1が空だと登録できない' do
        @parttime.pr_1 = ''
        @parttime.valid?
        expect(@parttime.errors.full_messages).to include("質問を入力してください")
      end
      it 'pr_2が空だと登録できない' do
        @parttime.pr_2 = ''
        @parttime.valid?
        expect(@parttime.errors.full_messages).to include("質問を入力してください")
      end
      it 'pr__3が空だと登録できない' do
        @parttime.pr_3 = ''
        @parttime.valid?
        expect(@parttime.errors.full_messages).to include("質問を入力してください")
      end
    end
  end
end