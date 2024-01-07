import axios from 'axios';
import React, { useEffect } from 'react'
import { useState } from 'react';
import { Chart } from 'primereact/chart';


function ProductTransaction() {

    var product = [];
    var total_pro = []
    const [Product, setProduct] = useState([]);

    useEffect(() => {
        axios.get(`/api/ProductTransaction/${localStorage.getItem('auth_id')}`).then(res => {
            if(res.data.status === 200) {
                setProduct(res.data.data);
            }
        }).catch((error) => {

        })
    },[]);

    for (let index = 0; index < Product.length; index++) {
        const pro = Product[index].name;
        const num = Product[index].total;
        
        product.push(pro)
        total_pro.push(num)
    }

    const data = {
        
        labels: product,
        datasets: [
            {
                label: 'Product Price Chart',
                data: total_pro,
                borderWidth: 1
            }
        ]
    };
    const options = {
        indexAxis: 'y',
        maintainAspectRatio: false,
        aspectRatio: 0.8,
        scales: {
            x: {
                grid: {
                    display: false
                }
            },
            y: {
                beginAtZero: true,
                grid: {
                    display: false
                }
            }
        }
    };


    return (
        <div>
            <Chart type="bar" style={{ height: "320px" }} width='100%'   data={data} options={options} />
        </div>
    )
}

export default ProductTransaction