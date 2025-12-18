Pour lancer l'api : 
    - cd api_mobile
    - venv/Scripts/activate
    - cd api
    - python manage.py runserver 
    le serveur devrait se lancer au http://127.0.0.1:8000/

Pour lancer l'application flutter :
    - cd front 
    - flutter run -d chrome --web-browser-flag "--disable-web-security"

    les config de sécurité n'étant pas encore faites ous devrait lancer chrome (ou votre navigateur spécifique ) sans contrôles de sécurité avec la commande ci-dessus