import axios from 'axios';
import { Skeleton } from 'primereact/skeleton';
import React, { useEffect, useState } from 'react'
import { Image } from 'primereact/image';
import swal from 'sweetalert';
import { DataTable } from 'primereact/datatable';
import { Column } from 'primereact/column';
import { Badge } from 'primereact/badge';
import { Tag } from 'primereact/tag';


function ProductDetails({data}) {

    const [ProductDetailsInfo, setProductDetailsInfo] = useState([]);
    const [BiddingUser, setBiddingUser] = useState([]);
    const [BiddingUserWin, setBiddingWin] = useState([]);
    const [loading, setloading] = useState(true);

    useEffect(() => {

        axios.get(`/api/ProductDetailsInformation/${data}`).then(res => {
            if (res.data.status === 200) {
                setProductDetailsInfo(res.data.product);
                setBiddingUser(res.data.list);
                setBiddingWin(res.data.win)
            }
            else {
            }
            setloading(false);
        }).catch((error) => {
            if (error.response.status === 500) {
                swal("Warning", error.response.statusText, 'warning');
            }
        })
    }, [data]);
    

    const PriceFormat = (BiddingUser) => {
        return (
            <>
            ₱{
                BiddingUser.tbl_biddingprice_fk.toFixed(2)
            }
            </>
        )
    }

    return (
        <div className='container-fluid'>
            <div className="row">
                    <div className="">
                        <div className="">
                            {
                                loading ? <Skeleton className='w-100' borderRadius='20' />
                                    :
                                    <>
                                        <Image width='100%' height='500' className='text-center mb-4 rounded w-100' src={`http://127.0.0.1:8000/${ProductDetailsInfo.image}`} tooltip='Image' alt='Photo' preview />
                                        <div className="col-lg-12 col-md-12 col-sm-12 mb-2">
                                            <p>{ProductDetailsInfo.description}</p>
                                        </div>
                                        <h6>Winner: <Tag className='' severity={'success'} value={BiddingUserWin.name_user} /> - <Tag severity={'success'} value={`₱${BiddingUserWin.tbl_biddingprice_fk.toFixed(2)}`} /></h6>
                                        <div className="col-lg-12 col-md-12 col-sm-12 mb-2">
                                            <DataTable  value={BiddingUser} header="Bid User"  paginatorLeft paginator rows={10}>
                                                <Column field='name_user' header="Name of Bidder" ></Column>
                                                <Column field='tbl_biddingprice_fk' body={PriceFormat} header="Amount Bid" ></Column>
                                            </DataTable>
                                            
                                        </div>

                                    </>
                            }
                        </div>
                    </div>
            </div>
        </div>
    )
}

export default ProductDetails