# k0s-test-terraform
k0sを試したときに構築したterraformです

## 環境
- `terraform` v0.12.29
  - 今回は[`asdf`](https://github.com/asdf-vm/asdf)を使用してterraformを使用しております。
- クラウドサービス
  - aws
  - awsアカウント、credentialを用意してある前提になります

## 使用前に
`provider.tf`に設定している`profile`を実際に使用するものに設定してください

## 使用方法
- `terraform`の`asdf plugin`をインストール
```shell
$ asdf plugin-add terraform https://github.com/Banno/asdf-hashicorp.git
```

- `terraform 0.12.29` をインストール
```shell
$ asdf install terraform v0.12.29
```

- `asdf`で terraform のバージョンを指定
```shell
$ asdf local terraform 0.12.29
```

- 反映する terraform リソースの差分を確認
```shell
$ terraform plan
```

- terraform を実際に反映する
```shell
$ terraform apply
```

## 注意
- セキュリティについては深く考えておりません
- 実際に試す際には**自己責任**でお願い致します