# HOMEWORK

## lecture 1:Course Overview & the shell. [solution](https://missing.csail.mit.edu/2020/course-shell/)

1. wsl
2. dir

    ```shell
    cd /tmp
    mkdir missing
    ```

3. creat file

    ```shell
    man touch
    # just touch hh
    ```

4. ```shell
    touch semester.txt
    ```

5. ```shell
    echo '#!/bin/sh' > semester.txt
    echo curl --head --silent https://missing.csail.mit.edu >> semester.txt
    ```

6. ```./semester``` runnable

7. ```shell
    man chmod
    chmod 777 semester
    # change mode
   ```

8. ```shell
    ./semester | grep last-modified > last_modified.txt
    ```

9. ```shell
    cd /sys/class/power_supply/BAT1
    cat capacity
    ```

## lecture 2:Shell Tools and Scripting. [solution](https://missing-semester-cn.github.io/missing-notes-and-solutions/2020/solutions/shell-tools-solution/)

1. ```shell
    ls -a -l -h --color=always -t
    ```

2. ```shell
    # macro
    macro(){
        echo $(pwd) > /mnt/f/linux/MSAYCS/tmp/missing/tst.txt
    }
    # polo
    polo(){
        cd $(cat /mnt/f/linux/MSAYCS/tmp/missing/tst.txt)
    }
    ```

3. ```shell
    #!/usr/bin/env bash
    num=0
    echo "Program starts at $(date)" > ./info.txt
    while :
    do
            let num="$num"+1
            ./script.sh >> ./info.txt 2>> ./info.txt
            if [[ "$?" -ne 0 ]]; then
                    break
            fi
    done
    echo "$num" >> ./info.txt
    ```

4. ```shell
    # xargs let the STDOUT be arguments and pipe to next      command
    find . -type f -name "*.html" | xargs -d '\n'  tar -cvzf html.zip
    # -d '\n' let delimiter be '\n' rather space
    ```

5. ```shell
    # remerber that 'find' is recursive(递归的)
    # using xargs command just noted
    find -type f | xargs ls -t -l | head -1    
    ```

## lecture 3:Editors (Vim). [solution](https://missing-semester-cn.github.io/missing-notes-and-solutions/2020/solutions/shell-tools-solution/)
