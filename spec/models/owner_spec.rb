require 'rails_helper'
describe Owner do
  before do
    @owner = FactoryBot.build(:owner)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'firstnameとlastnameとnameとemailとpasswordとpassword_confirmationが存在すれば登録できる' do
        expect(@owner).to be_valid
      end
      it 'passwordが8文字以上であれば登録できる' do
        @owner.password = 'aaaa0000'
        @owner.password_confirmation = 'aaaa0000'
        expect(@owner).to be_valid
      end
      it 'passwordとpassword_confirmationが同じなら登録できる' do
        @owner.password = @owner.password_confirmation
        expect(@owner).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'firstnameが空だと登録できない' do
        @owner.firstname = ''
        @owner.valid?
        expect(@owner.errors.full_messages).to include('苗字を入力してください')
      end
      it 'lastnameが空だと登録できない' do
        @owner.lastname = ''
        @owner.valid?
        expect(@owner.errors.full_messages).to include('名前を入力してください')
      end
      it 'emailが空では登録できない' do
        @owner.email = ''
        @owner.valid?
        expect(@owner.errors.full_messages).to include('メールアドレスを入力してください')
      end
      it '重複したemailが存在する場合登録できない' do
        @owner.save
        another_owner = FactoryBot.build(:owner, email: @owner.email)
        another_owner.valid?
        expect(another_owner.errors.full_messages).to include('メールアドレスはすでに存在します')
      end
      it 'emailに@が含まれていなければ登録できない' do
        @owner.email = 'aaaaaaaaaa'
        @owner.valid?
        expect(@owner.errors.full_messages).to include
      end
      it 'passwordが空では登録できない' do
        @owner.password = ''
        @owner.valid?
        expect(@owner.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'passwordが7文字以下であれば登録できない' do
        @owner.password = 'aaa0000'
        @owner.password_confirmation = @owner.password
        @owner.valid?
        expect(@owner.errors.full_messages).to include('パスワードは8文字以上で入力してください')
      end
      it 'passwordに半角英字がなければ登録できない' do
        @owner.password = '00000000'
        @owner.password_confirmation = @owner.password
        @owner.valid?
        expect(@owner.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'passwordに半角数字がなければ登録できない' do
        @owner.password = 'aaaaaaaa'
        @owner.password_confirmation = @owner.password
        @owner.valid?
        expect(@owner.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @owner.password_confirmation = ''
        @owner.valid?
        expect(@owner.errors.full_messages).to include('確認用のパスワードとパスワードの入力が一致しません')
      end
      it 'passwordとpassword_confirmationが一致しなければ登録できない' do
        @owner.password = 'aaaa0000'
        @owner.password_confirmation = 'aaaa1111'
        @owner.valid?
        expect(@owner.errors.full_messages).to include('確認用のパスワードとパスワードの入力が一致しません')
      end
    end
  end
end
