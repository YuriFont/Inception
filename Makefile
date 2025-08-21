NAME = inception

$(NAME):
        docker compose -f srcs/docker-compose.yml up -d --build

clean:
        docker compose -f srcs/docker-compose.yml down

fclean: clean
        docker system prune -af --volumes

re: fclean $(NAME)
