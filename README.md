# todo_app

A new Flutter Simple Todo App project. In this project, I use DDD and TDD. There are two Domain, User and Todo.

Coverage: 

![coverage](https://github.com/DumbZecretary/todo_bloc/blob/master/images_makedown/coverage.png?raw=true)

The model for Hive can't be tested 100% because I don't mock to test the concept of Hive. I think mocking this is unnecessary.

## UI

| ![icon](https://github.com/DumbZecretary/todo_bloc/blob/master/images_makedown/icon.png?raw=true)  | ![main screen](https://github.com/DumbZecretary/todo_bloc/blob/master/images_makedown/1.png?raw=true)  | ![side menu](https://github.com/DumbZecretary/todo_bloc/blob/master/images_makedown/2.png?raw=true)  | ![all tasks screen](https://github.com/DumbZecretary/todo_bloc/blob/master/images_makedown/3.png?raw=true)  |
|---|---|---|---|
| ![by status list tasks screen](https://github.com/DumbZecretary/todo_bloc/blob/master/images_makedown/4.png?raw=true)  | ![create screen](https://github.com/DumbZecretary/todo_bloc/blob/master/images_makedown/5.png?raw=true)  | ![update screen](https://github.com/DumbZecretary/todo_bloc/blob/master/images_makedown/6.png?raw=true)  | ![update result screen](https://github.com/DumbZecretary/todo_bloc/blob/master/images_makedown/7.png?raw=true)  |

### Checking the UI, Splash Screen and App Icon:

Android real devices: :white_check_mark:

IOS real devices: :x: ( I don't have any IOS devices :disappointed_relieved: )

Android simulators: :white_check_mark:

IOS simulators: :white_check_mark:

## Troubleshoot

This project using Hive. But Hive has a problem itself. Please check the link below:

https://github.com/hivedb/hive/issues/620

## TODO:

- Welcome Screen (User Domain)

- Save tasks by using another repository without Hive (maybe some SQL database)

- Complete the current tech specs

- Complete the current product specs

- Release to Store (optional)