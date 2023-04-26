#!/bin/bash

# Проверяем, что скрипт был вызван с аргументами
if [ $# -eq 0 ]; then
  echo "Ошибка: путь к директории не задан"
  exit 1
fi

# Проверяем, что заданная директория существует
if [ ! -d $1 ]; then
  echo "Ошибка: директория не найдена"
  exit 1
fi

# Копируем файлы в директории, названные по имени владельца
for file in $1/*; do
  if [ -f "$file" ]; then
    owner=$(stat -c "%U" "$file")
    target_dir="$1/$owner"
    if [ ! -d "$target_dir" ]; then
      mkdir "$target_dir"
    fi
    if [ "$owner" == "$(stat -c "%U" "$target_dir")" ]; then
      cp "$file" "$target_dir"
    fi
  fi
done
