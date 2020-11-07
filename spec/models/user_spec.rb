require 'rails_helper'

describe User do
  before do
    @user = FactoryBot.build(:user)
    @user.image = fixture_file_upload('/files/test_image.png')
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '記入必須項目が全て入力されていれば登録できる' do
        expect(@user).to be_valid
      end
      it 'firstnameが全角入力だと登録できる' do
        @user.firstname = '田中'
        expect(@user).to be_valid
      end
      it 'lastnameが全角入力だと登録できる' do
        @user.lastname = '太郎'
        expect(@user).to be_valid
      end
      it 'firstname_kanaが全角かな入力だと登録できる' do
        @user.firstname_kana = 'たなか'
        expect(@user).to be_valid
      end
      it 'lastname_kanaが全角かな入力だと登録できる' do
        @user.lastname_kana = 'たろう'
        expect(@user).to be_valid
      end
      it 'passwordが8文字以上かつ英数字混合であれば登録できる' do
        @user.password = 'aaaa0000'
        @user.password_confirmation = 'aaaa0000'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが同じなら登録できる' do
        @user.password = @user.password_confirmation
        expect(@user).to be_valid
      end
      it 'phone_numberが10桁なら登録できる' do
        @user.phone_number = '0001112222'
        expect(@user).to be_valid
      end
      it 'phone_numberが11桁なら登録できる' do
        @user.phone_number = '00011112222'
        expect(@user).to be_valid
      end
      it 'postal_codeが7桁なら登録できる' do
        @user.postal_code = '1111111'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'firstnameが空だと登録できない' do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字を入力してください')
      end
      it 'lastnameが空だと登録できない' do
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前を入力してください')
      end
      it 'firstnameが英字だと登録できない' do
        @user.firstname = 'smith'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字は不正な値です')
      end
      it 'lastname英字だと登録できない' do
        @user.lastname = 'john'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前は不正な値です')
      end
      it 'firstname_kanaが空だと登録できない' do
        @user.firstname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字（ふりがな）を入力してください')
      end
      it 'lastname_kanaが空だと登録できない' do
        @user.lastname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（ふりがな）を入力してください')
      end
      it 'firstname_kanaが英字だと登録できない' do
        @user.firstname_kana = 'smith'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字（ふりがな）は不正な値です')
      end
      it 'lastname_kanaが英字だと登録できない' do
        @user.lastname_kana = 'john'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（ふりがな）は不正な値です')
      end
      it 'firstname_kanaが漢字だと登録できない' do
        @user.firstname_kana = '田中'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字（ふりがな）は不正な値です')
      end
      it 'lastname_kanaが漢字だと登録できない' do
        @user.lastname_kana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（ふりがな）は不正な値です')
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスを入力してください')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'passwordが7文字以下であれば登録できない' do
        @user.password = 'aaa0000'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは8文字以上で入力してください')
      end
      it 'passwordに半角英字がなければ登録できない' do
        @user.password = '00000000'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'passwordに半角数字がなければ登録できない' do
        @user.password = 'aaaaaaaa'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('確認用のパスワードとパスワードの入力が一致しません')
      end
      it 'passwordとpassword_confirmationが一致しなければ登録できない' do
        @user.password = 'aaaa0000'
        @user.password_confirmation = 'aaaa1111'
        @user.valid?
        expect(@user.errors.full_messages).to include('確認用のパスワードとパスワードの入力が一致しません')
      end
      it 'birth_dayが空では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('生年月日を入力してください')
      end
      it 'phone_numberが空では登録できない' do
        @user.phone_number = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('電話番号を入力してください')
      end
      it 'phone_numberが9桁以下では登録できない' do
        @user.phone_number = '000111222'
        @user.valid?
        expect(@user.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'phone_numberが12桁以上では登録できない' do
        @user.phone_number = '111222333444'
        @user.valid?
        expect(@user.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'postal_codeが空では登録できない' do
        @user.postal_code = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('郵便番号を入力してください')
      end
      it 'postal_codeが6桁以下では登録できない' do
        @user.postal_code = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('郵便番号は不正な値です')
      end
      it 'postal_codeが8桁以上では登録できない' do
        @user.postal_code = '00000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('郵便番号は不正な値です')
      end
      it 'prefecture_idが空では登録できない' do
        @user.prefecture_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('都道府県を入力してください')
      end
      it 'cityが空では登録できない' do
        @user.city = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('番地を入力してください')
      end
      it 'highschoolが空では登録できない' do
        @user.highschool = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('高校名を入力してください')
      end
      it 'h_admissionが空では登録できない' do
        @user.h_admission = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('高校入学年度を入力してください')
      end
      it 'stationが空では登録できない' do
        @user.station = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('最寄り駅を入力してください')
      end
      it 'spouseが空では登録できない' do
        @user.spouse = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('配偶者の有無を入力してください')
      end
    end
  end
end
