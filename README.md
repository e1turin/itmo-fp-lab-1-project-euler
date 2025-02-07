# Лабораторная работа №1 по курсу «Функциональное программирование»

Выполнил: Тюрин Иван, группа P34102

Текст задания: [TASK.md](./TASK.md)

Вариант: `13,18`
- https://projecteuler.net/problem=13
- https://projecteuler.net/problem=18

# Комментарии по выполнению

Для комфортной работы хочется иметь LSP и интеграцию с REPL, но на Windows
Idris2 ведет себя странно и в MSYS он не хочет собирать `pack` (пакетный
менеджер и не только для Idris2). Поэтому было принято решение использовать
образ Docker с настроенным окружением в виде готового `pack` и установленным
`idris2-lsp` (см. [docker/Dockerfile.idris2-pack-lsp](./docker/Dockerfile.idris2-pack-lsp)).

Пакетный менеджер `pack` достает информацию о пакетах из системы или из конфигурации в проекте – `pack.toml`, без нее не известно как соотносится имя с пакетом. В конфигурации проекта может указывается путь до локальной конфигурации пакета, где уже описаны зависимости этого пакета и прочее.

Файлы `.ipkg` позволяют указать в качестве зависимости (`deps`) другие пакеты,
но чтобы это работало, они должны быть "установлены". Список установленных
пакетов можно увидеть с помощью команды `pack info`. И поэтому LSP не может
анализировать пакеты, в зависисмостях которых указаны неустановленные пакеты
(библиотеки). Пакеты устанавливаются автоматически, если `pack` находит нужные в
зависимостях пакеты в конфигурации проекта (`pack.toml`).
- Стоит отличать установленные "библиотеки" и "приложения". Приложения автоматически
  устанавливаются при попытке сделать `pack run app-pkg`.
- Собственноручно установть пакет можно с помощью `pack install lib-pkg` (для библиотек)
  или `pack install-app app-pkg` (для приложений).
- Удалять установленные пакеты можно с помощью `pack remove lib-pkg` (для библиотек)
  или `pack remove-app app-pkg` (для приложений).
- еще есть какой-то нюанс с `package collection`...

Тестить и смотреть справку удобно с помощью отдельно запущенного REPL:
```sh
docker exec -ai dev_container_name /bin/bash # attach to running container in separate terminal
cd workspace/itmo-fp                         # go to project directory
#pack --with-ipkg=task-13/task-13.ipkg repl   # start repl session for specific package -- can't load source file by somehow...
pack repl task-13/src/Main.idr  # start repl on specific source file
```

Для Idris2 есть неофициальный Style Guide:
- https://github.com/stefan-hoeck/idris2-style-guide (от создателя `pack`)
- или другой https://github.com/expede/idris-styleguide.

Так же можно использовать готовый `.editorconfig` (с расширением VS Code
`EditorConfig.EditorConfig`) из репозитория Idris2:
```sh
wget https://raw.githubusercontent.com/idris-lang/Idris2/refs/heads/main/.editorconfig
# or
curl -L -O https://raw.githubusercontent.com/idris-lang/Idris2/refs/heads/main/.editorconfig
# or
echo -e 'GET /idris-lang/Idris2/refs/heads/main/.editorconfig HTTP/1.0\nHost: raw.githubusercontent.com\n\n' | openssl s_client -quiet -connect raw.githubusercontent.com:443 2>/dev/null | sed '0,/^\s*$/d' > .editorconfig
```

По какой-то причине `idris2-lsp` не воспринимает пакеты, которые установил
`pack` в свои пути (`$PACK_DIR`), в частности модули `test` не могут найти
зависимости на свои модули-пакеты с исходниками. Это решается путем
самостоятельной установки каждого нужного пакетв в пути idris2: `idris2
--install path/to/package/config.ipkg`. Похоже, что LSP и pack не получается так
просто совместить, по этому поводу даже есть ишью:
- https://github.com/idris-community/idris2-lsp/issues/219 и
- https://github.com/stefan-hoeck/idris2-pack/issues/292.
Там предложили в качестве временной меры добавить в переменные окружения для LSP
пути используемые в pack (см.
[idris2-lsp_fix-pack](https://github.com/e1turin/itmo-fp/blob/docker/idris2-lsp_fix-pack) -- не работает).