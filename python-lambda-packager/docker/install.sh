cd working && \
    rm -rf packaged-lambda && \
    rm -rf packaged-layer && \
    mkdir -p packaged-lambda && \
    mkdir -p packaged-layer/python
    
# package layer modules & requirements
cp -r modules/* packaged-layer/python
pip3 install -t packaged-layer/python -r modules/requirements.txt

# package function modules & requirements
cp -r function/* packaged-lambda/
pip3 install -t packaged-lambda -r function/requirements.txt

# zipping
cd packaged-layer && \
    zip -r9 ../packaged-layer.zip . && \
    cd .. && rm -rf packaged-layer

cd packaged-lambda && \
    zip -r9 ../packaged-lambda.zip . && \
    cd .. && rm -rf packaged-lambda

