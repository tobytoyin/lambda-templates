cd working && \
    rm -rf packaged-lambda && \
    rm -rf packaged-layer && \
    mkdir -p packaged-lambda && \
    mkdir -p packaged-layer/python
    
# package layer modules & requirements
cp -r modules/* packaged-layer/python
pip3 install \
    --platform manylinux2014_x86_64   --implementation cp   --python 3.9   --only-binary=:all: --upgrade\
    -t packaged-layer/python -r modules/requirements.txt

# package function modules & requirements
cp -r function/* packaged-lambda/
pip3 install \
    --platform manylinux2014_x86_64   --implementation cp   --python 3.9   --only-binary=:all: --upgrade\
    -t packaged-lambda -r function/requirements.txt

# zipping
cd packaged-layer && \
    zip -r9 ../packaged-layer.zip ./python/ && \
    cd .. && rm -rf packaged-layer

cd packaged-lambda && \
    zip -r9 ../packaged-lambda.zip . && \
    cd .. && rm -rf packaged-lambda

