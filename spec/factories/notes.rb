# factorybotはテストデータのセットアップをおこなってくれる
FactoryBot.define do
  # 下記の記述により、テスト内で FactoryBot.create(:note) と書けば
  # 簡単に新しいユーザーを作成できる。
  # Noteモデルのスペックで使用可能

  factory :note do
    message "My important note."
    association :project
    user { project.owner }

    # トレイトを使用し、ファイルが最初から添付されたnoteを作成
    trait :with_attachment do
      attachment { File.new("#{Rails.root}/spec/files/attachment.jpg") }
    end
  end
end
