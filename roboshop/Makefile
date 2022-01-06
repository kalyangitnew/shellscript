none:
	@grep '##' Makefile | grep -v grep | sed -e 's/##//'
git-pull:
	@echo git is pulling code -------- completed
	git pull &>/dev/null
cart: git-pull ## Setup Cart Component
	@bash components/cart.sh

catalogue: git-pull ## Setup Catalogue component
	@bash components/catalogue.sh

user: git-pull ## Setup User Component
	@bash components/user.sh

shipping: git-pull ## Setup Shipping Component
	@bash components/shipping.sh

payment: git-pull ## Setup Payment Component
	@bash components/payment.sh

frontend: git-pull ## Setup Frontend Component
	@bash components/frontend.sh

mysql: git-pull ## Setup Mysql Component
	@bash components/mysql.sh

Redis: git-pull ## Setup Redis Component
	@bash components/redis.sh

rabbitmq: git-pull ## Setup RabbitMQ Component
	@bash components/rabbitmq.sh

mongodb: git-pull ## Setup MongoDB Component
	@bash components/mongodb.sh




