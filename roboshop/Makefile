none:
	@grep '##' Makefile | grep -v grep | sed -e 's/##//'
git-pull:
	@echo git is pulling code -------- completed
	@git pull &>/dev/null
cart: git-pull ## Setup Cart Component
	@sudo bash components/cart.sh

catalogue: git-pull ## Setup Catalogue component
	@sudo bash components/catalogue.sh

user: git-pull ## Setup User Component
	@sudo bash components/user.sh

shipping: git-pull ## Setup Shipping Component
	@sudo bash components/shipping.sh

payment: git-pull ## Setup Payment Component
	@sudo bash components/payment.sh

frontend: git-pull ## Setup Frontend Component
	@sudo bash components/frontend.sh

mysql: git-pull ## Setup Mysql Component
	@sudo bash components/mysql.sh

Redis: git-pull ## Setup Redis Component
	@sudo bash components/redis.sh

rabbitmq: git-pull ## Setup RabbitMQ Component
	@sudo bash components/rabbitmq.sh

mongodb: git-pull ## Setup MongoDB Component
	@sudo bash components/mongodb.sh

# we are using git-pull function to avoid git pull command in com line everytime




